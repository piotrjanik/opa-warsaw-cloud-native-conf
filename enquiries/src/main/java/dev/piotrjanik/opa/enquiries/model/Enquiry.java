package dev.piotrjanik.opa.enquiries.model;

import lombok.Builder;
import lombok.Data;
import lombok.NonNull;

@Data
@Builder
public class Enquiry {
    @NonNull
    Integer id;
    @NonNull
    Customer customer;
    @NonNull
    String message;
    @NonNull
    Boolean resolved = false;
}

