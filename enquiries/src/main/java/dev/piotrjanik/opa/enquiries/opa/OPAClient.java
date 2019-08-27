package dev.piotrjanik.opa.enquiries.opa;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.BodyInserters;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Mono;


@Component
@Slf4j
public class OPAClient {

    @Value("${opa.url}")
    private String opaUrl;

    private WebClient webClient;

    public OPAClient() {
        this.webClient = WebClient.builder().baseUrl(opaUrl).build();
    }

    public Mono<String> check(Input input) {
        log.debug("Sending OPA request: " + input.toString());
        return webClient
                .post()
                .uri(opaUrl)
                .body(BodyInserters.fromObject(new OpaRequest(input)))
                .retrieve()
                .onStatus(HttpStatus::is5xxServerError,
                        r -> r.bodyToMono(OpaError.class).map(OpaException::new)
                )
                .bodyToMono(Result.class)
                .map(Result::getResult)
                .flatMap(allow -> allow ? Mono.just("ok") : Mono.error(new AccessDeniedException("Access denied by OPA :D")));
    }

    @Data
    @AllArgsConstructor
    private static class OpaRequest {
        private Input input;
    }

    @Data
    @NoArgsConstructor
    private static class OpaError {
        String code;
        String message;
    }

    private static class OpaException extends Exception {

        OpaException(OpaError opaError) {
            super(String.format("%s %s", opaError.getMessage(), opaError.getCode()));
        }
    }

    @Getter
    @NoArgsConstructor
    private static class Result {
        private Boolean result;
    }
}