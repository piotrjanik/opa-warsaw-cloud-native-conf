package dev.piotrjanik.opa.enquiries.opa;

import lombok.Builder;
import lombok.Data;
import lombok.NonNull;

@Data
@Builder
public class Resource {
    @NonNull
    String name;
    Integer id;
}
