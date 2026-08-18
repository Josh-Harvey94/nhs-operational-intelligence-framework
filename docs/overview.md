# Framework Overview

## Problem

Operational teams often have two separate problems:

1. **Data visibility:** dashboards and source systems show measurements but do not always explain movement, context or what needs attention.
2. **Operational grip:** meetings, emails and chats contain actions and risks, but ownership, deadlines, discrepancies and unresolved points are easily lost.

This framework deliberately separates those problems into two agents.

## Layer 1 — Data Intelligence

The Info Manager Agent:
- selects the correct structured source for the question;
- understands reporting cadence and NULL semantics;
- compares like-for-like periods;
- identifies meaningful movement without overstating noise;
- states provenance;
- produces concise, action-oriented operational intelligence.

## Layer 2 — Operational Grip

The System Grip Agent:
- uses the structured source as the authority for quantitative operational figures;
- uses approved narrative sources for what was discussed, agreed or escalated;
- separates fact, interpretation and absence;
- finds missing owners, deadlines, mitigations and closure;
- identifies data/narrative discrepancies;
- produces meeting prep, handovers, action tracking and follow-up prompts.

## Why two agents?

The separation reduces a common failure mode: allowing unstructured narrative to override measured operational facts, or allowing a quantitative dashboard to imply that it understands unresolved operational commitments.

A deployment may combine both layers in one product, but the conceptual boundary should remain explicit.
