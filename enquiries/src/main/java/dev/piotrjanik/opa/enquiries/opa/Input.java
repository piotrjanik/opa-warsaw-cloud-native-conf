package dev.piotrjanik.opa.enquiries.opa;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@AllArgsConstructor
public class Input {
    private String principal;
    private String action;
    private Resource resource;
}
