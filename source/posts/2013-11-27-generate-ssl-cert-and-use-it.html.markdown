---
layout: post
title:  "Generate a SSL Certificate and Using it"
date:   2013-11-27
categories: ssl certificate
summary: A task not done all that often and always difficult to have go smoothly. Here is the flow for generating an SSL Certificate and using it
permalink: generate-ssl-certificates/
---
A task not done all that often and always difficult to have go smoothly. Here is the flow for generating an SSL Certificate and using it:

## Step 1. Private Key and Certificate Signing Request (CSR)

NOTE: Rare but, some certificate authorities will generate a CSR and key for you; you download an entire bundle (.key, .pem)

More common is to generate them using standard openssl commands

## Step 2. Certificate Authority

So you now have two files:
a Private Key which is yours to keep and a
Certificate Signing Request (CSR) that now has to be submitted to a Certificate Authority like Verisign.

The Certificate Authority will then create a new certificate for you to use. That Certificate will be in the form of a PEM or CRT file. Based on your Certificate Signing Request (CSR) and tied to your Private Key.

## Step 3. Setup the Web Server

Once you have your crt or pem file and your Private Key, you will use those to configure our web server.

By Don Najd