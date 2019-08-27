package dev.piotrjanik.opa.enquiries;

import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.web.reactive.EnableWebFluxSecurity;
import org.springframework.security.config.web.server.ServerHttpSecurity;
import org.springframework.security.web.server.SecurityWebFilterChain;

@EnableWebFluxSecurity
class SecurityConfig {

    @Bean
    public SecurityWebFilterChain securityWebFilterChain(ServerHttpSecurity http) {
        return http.authorizeExchange()
                .pathMatchers("/actuator/health").permitAll()
                .and()
                .authorizeExchange().anyExchange().authenticated().and().oauth2ResourceServer().jwt()
                .and().and().build();
    }

}
