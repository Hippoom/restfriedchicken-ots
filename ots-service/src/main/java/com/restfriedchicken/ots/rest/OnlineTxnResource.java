package com.restfriedchicken.ots.rest;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import static org.springframework.hateoas.mvc.ControllerLinkBuilder.linkTo;
import static org.springframework.hateoas.mvc.ControllerLinkBuilder.methodOn;
import static org.springframework.http.HttpStatus.ACCEPTED;
import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@RestController
@RequestMapping("/online-txn")
public class OnlineTxnResource {

    @RequestMapping(method = POST,
            consumes = APPLICATION_JSON_VALUE,
            produces = APPLICATION_JSON_VALUE)
    @ResponseBody
    protected HttpEntity<OnlineTxnRepresentation> createOnlineTxn() {
        final OnlineTxnRepresentation onlineTxn = new OnlineTxnRepresentation();

        onlineTxn.add(linkTo(OnlineTxnResource.class).withSelfRel());

        return new ResponseEntity<>(onlineTxn, ACCEPTED);
    }
}
