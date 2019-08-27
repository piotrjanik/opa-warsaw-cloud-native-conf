package dev.piotrjanik.opa.enquiries.repository;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.CollectionLikeType;
import dev.piotrjanik.opa.enquiries.model.Enquiry;
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
public class EnquiriesRepository {
    private ResourceLoader resourceLoader;
    private ObjectMapper objectMapper;
    private Map<Integer, Enquiry> enquiries;

    public EnquiriesRepository(ResourceLoader resourceLoader, ObjectMapper objectMapper) {
        this.resourceLoader = resourceLoader;
        this.objectMapper = objectMapper;
        this.enquiries = loadData();
    }

    public Mono<Enquiry> getById(Integer id) {
        return Mono.just(enquiries.get(id));
    }

    public Flux<Enquiry> getAll() {
        return Flux.fromIterable(enquiries.values());
    }

    public Mono<Enquiry> update(Integer id, Enquiry enquiry) {
        return Mono.just(enquiries.put(id, enquiry));
    }

    private Map<Integer, Enquiry> loadData() {
        try {
            InputStream inputStream = resourceLoader.getResource("classpath:enquiries.json").getInputStream();
            CollectionLikeType collectionLikeType = objectMapper.getTypeFactory().constructCollectionLikeType(List.class, Enquiry.class);
            List<Enquiry> enquiries = objectMapper.readValue(inputStream, collectionLikeType);
            return enquiries.stream().collect(Collectors.toMap(Enquiry::getId, Function.identity()));
        } catch (IOException e) {
            log.error("Error while loading data", e);
        }
        return null;
    }
}
