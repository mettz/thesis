# Examples

## Simple

- For:
  1. Blockchain interaction: simple
  2. Test complexity: easy -> 1 simple function
- Recursion:
  1. Blockchain interaction: simple
  2. Test complexity: easy -> a bunch of simple function
- SimpleStorage:
  1. Blockchain interaction: simple
  2. Test complexity: easy -> 2 simple function
- ViewAndPure:
  1. Blockchain interaction: simple
  2. Test complexity: easy -> 2 simple function
- Visibility:
  1. Blockchain interaction: simple
  2. Test complexity: medium -> two contracts, one calls the other
- ConstAndImmutable:
  1. Blockchain interaction: simple
  2. Test complexity: medium -> check how to test immutables and constants impact and constructor
- New:
  1. Blockchain interaction: simple
  2. Test complexity: medium -> constructor of D, createAndEndowD does not work

## Complex

- Ballot:
  1. Blockchain interaction: simple
  2. Test complexity: hard
- BlindAuction:
  1. Blockchain interaction: simple
  2. Test complexity: easy -> a bunch of simple function
- Purchase:
  1. Blockchain interaction: simple
  2. Test complexity: easy -> 2 simple function
- SimpleAuction:
  1. Blockchain interaction: simple
  2. Test complexity: easy -> 2 simple function
- SimplePaymentChannel:
  1. Blockchain interaction: simple
  2. Test complexity: medium -> two contracts, one calls the other
- Token:
  1. Blockchain interaction: simple
  2. Test complexity: medium -> two contracts, one calls the other

## Needs more experiments

- Modifiers
- Libraries
- New#createAndEndowD
- ReceiveAndFallback
- TryCatch
