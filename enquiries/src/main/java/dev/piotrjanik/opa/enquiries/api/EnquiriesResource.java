package dev.piotrjanik.opa.enquiries.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import dev.piotrjanik.opa.enquiries.model.Enquiry;
import dev.piotrjanik.opa.enquiries.opa.Input;
import dev.piotrjanik.opa.enquiries.opa.OPAClient;
import dev.piotrjanik.opa.enquiries.opa.Resource;
import dev.piotrjanik.opa.enquiries.repository.EnquiriesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.web.bind.annotation.*;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

@RestController
public class EnquiriesResource {

    @Autowired
    ObjectMapper objectMapper;

    @Autowired
    EnquiriesRepository repository;

    @Autowired
    OPAClient opaClient;

    @GetMapping("enquiries")
    public Flux<Enquiry> getAll(@AuthenticationPrincipal Jwt jwt) {

        Input input = Input.builder()
                .principal(jwt.getTokenValue())
                .action("GetAll")
                .resource(Resource.builder().name("enquiries").build())
                .build();

        return opaClient
                .check(input)
                .flatMapMany((r) -> repository.getAll());
    }

    @GetMapping("enquiries/{id}")
    public Mono<Enquiry> getById(@AuthenticationPrincipal Jwt jwt, @PathVariable Integer id) {

        Input input = Input.builder()
                .principal(jwt.getTokenValue())
                .action("GetOne")
                .resource(Resource.builder().name("enquiries").id(id).build())
                .build();

        return opaClient
                .check(input)
                .flatMap((d) -> repository.getById(id));
    }

    @PutMapping("enquiries/{id}")
    public Mono<Enquiry> getById(@AuthenticationPrincipal Jwt jwt, @PathVariable Integer id, @RequestBody Enquiry enquiry) {

        Input input = Input.builder()
                .principal(jwt.getTokenValue())
                .action("Update")
                .resource(Resource.builder().name("enquiries").id(id).build())
                .build();

        return opaClient
                .check(input)
                .flatMap((d) -> repository.update(id, enquiry));
    }

}
