package dev.piotrjanik.opa.orders.model;

import lombok.Builder;
import lombok.Data;
import lombok.NonNull;

@Builder
@Data
public class Item {
    @NonNull
    String id;
    @NonNull
    String name;
}
