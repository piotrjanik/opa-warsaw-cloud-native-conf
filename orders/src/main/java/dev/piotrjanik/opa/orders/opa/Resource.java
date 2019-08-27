package dev.piotrjanik.opa.orders.opa;

import dev.piotrjanik.opa.orders.model.Order;
import lombok.Builder;
import lombok.Data;
import lombok.NonNull;

import javax.validation.constraints.NotNull;

@Data
@Builder
public class Resource {
    @NonNull
    String name;
    Integer id;
    Order.Status status;
}
