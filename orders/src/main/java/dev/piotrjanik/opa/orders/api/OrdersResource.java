package dev.piotrjanik.opa.orders.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import dev.piotrjanik.opa.orders.model.Order;
import dev.piotrjanik.opa.orders.opa.Input;
import dev.piotrjanik.opa.orders.opa.OPAClient;
import dev.piotrjanik.opa.orders.opa.Resource;
import dev.piotrjanik.opa.orders.repository.OrdersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.web.bind.annotation.*;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

@RestController
public class OrdersResource {

    @Autowired
    ObjectMapper objectMapper;

    @Autowired
    OrdersRepository repository;

    @Autowired
    OPAClient opaClient;

    @GetMapping("orders")
    public Flux<Order> getAll(@AuthenticationPrincipal Jwt jwt) {

        Input input = Input.builder()
                .principal(jwt.getTokenValue())
                .action("GetAll")
                .resource(Resource.builder().name("orders").build())
                .build();

        return opaClient
                .check(input)
                .flatMapMany((r) -> repository.getAll());
    }

    @GetMapping("orders/{id}")
    public Mono<Order> getById(@AuthenticationPrincipal Jwt jwt, @PathVariable Integer id) {

        Input input = Input.builder()
                .principal(jwt.getTokenValue())
                .action("GetOne")
                .resource(Resource.builder().name("orders").id(id).build())
                .build();
        return opaClient
                .check(input)
                .flatMap((d) -> repository.getById(id));
    }

    @PutMapping("orders/{id}")
    public Mono<Order> getById(@AuthenticationPrincipal Jwt jwt, @PathVariable Integer id, @RequestBody Order order) {

        Input input = Input.builder()
                .principal(jwt.getTokenValue())
                .action("Update")
                .resource(Resource.builder().name("orders").status(order.getStatus()).id(id).build())
                .build();

        return opaClient
                .check(input)
                .flatMap((d) -> repository.update(id, order));
    }

}
