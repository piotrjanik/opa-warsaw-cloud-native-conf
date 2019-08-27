package dev.piotrjanik.opa.orders.model;

import lombok.Builder;
import lombok.Data;
import lombok.NonNull;

import java.util.List;

@Data
@Builder
public class Order {
    @NonNull
    Integer id;
    @NonNull
    List<Item> items;
    Status status;

    public static enum Status {
        SHIPPED, PENDING, CANCELLED
    }
}

