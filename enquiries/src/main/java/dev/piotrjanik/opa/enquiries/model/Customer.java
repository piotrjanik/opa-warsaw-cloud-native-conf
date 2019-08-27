package dev.piotrjanik.opa.enquiries.model;

import lombok.Builder;
import lombok.Data;
import lombok.NonNull;

@Builder
@Data
public class Customer {
    @NonNull
    String id;
    @NonNull
    String name;
}
