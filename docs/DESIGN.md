# ZypeVideoApp Design Document

## Overview

ZypeVideoApp is a basic RoR app intended to provide a list of videos from Zype, and the ability to play a selected video.
It provides a default view for the user, and additionally, an API could be implemented for a custom view intended to use with single-page-app-like frameworks.
 
## Architecture

### MODELS
#### Video
This object has a few goals:

- it communicates (indirectly) with Zype's API;
- it intends to hide the uneeded details that come from Zype's API responses
- it provides some encapsulation to access those that matter;
- it could perform sanitization for API responses.

It uses an API wrapper under the hood (see `ZypeApi::Client`).

### CONTROLLERS
#### VideoController
Collects the necessary information to build the views by delegating the list/detail calls to the `Video` model.
Could expose other formats besides HTML.

### SERVICES
#### ZypeApi::Client
A small service is provided in order to encapsulate API calls and perform a little data formatting prior to handling the information for the model(s) to consume.

## Specifications

A few specs in RSpec format are provided for the developer to understand how the different components interact with each other.