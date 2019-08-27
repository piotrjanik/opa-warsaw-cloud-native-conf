package dev.piotrjanik.opa.orders.repository;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.CollectionLikeType;
import dev.piotrjanik.opa.orders.model.Order;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Repository;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

@Repository
@Slf4j
@Scope(value = ConfigurableBeanFactory.SCOPE_SINGLETON)
public class OrdersRepository {
    private ResourceLoader resourceLoader;
    private ObjectMapper objectMapper;
    private Map<Integer, Order> enquiries;

    public OrdersRepository(ResourceLoader resourceLoader, ObjectMapper objectMapper) {
        this.resourceLoader = resourceLoader;
        this.objectMapper = objectMapper;
        this.enquiries = loadData();
    }

    public Mono<Order> getById(Integer id) {
        return Mono.just(enquiries.get(id));
    }

    public Flux<Order> getAll() {
        return Flux.fromIterable(enquiries.values());
    }

    public Mono<Order> update(Integer id, Order order) {
        return Mono.just(enquiries.put(id, order));
    }

    private Map<Integer, Order> loadData() {
        try {
            InputStream inputStream = resourceLoader.getResource("classpath:orders.json").getInputStream();
            CollectionLikeType collectionLikeType = objectMapper.getTypeFactory().constructCollectionLikeType(List.class, Order.class);
            List<Order> enquiries = objectMapper.readValue(inputStream, collectionLikeType);
            return enquiries.stream().collect(Collectors.toMap(Order::getId, Function.identity()));
        } catch (IOException e) {
            log.error("Error while loading data", e);
        }
        return null;
    }
}
