# PoC Comparison of Migration Methodologies

Here we test several techniques for running Django migrations

## Components

- Advance (Django Application)
- Postgresql

## Process

1. Create or Update a model in polls/models.py to force a data migration
2. `./manage.py makemigrations`
3. Select method for testing migration (from below)

## Considerations

- replicas > 1
- idemptotentcy

### initContainer

initContainer utilizes the deployment [initContainer](https://kubernetes.io/docs/concepts/workloads/pods/init-containers/) to execute a migration before the application is started.

Pros:

- Ensures a single migration occurs at a time(?)

Cons:

- Puts application logic outside the application
- More complex to debug

Neutral:

- If the Pod restarts, or is restarted, all init containers must execute again.

### Startup Script

Summary

Pros:

Cons:

### Kubernetes Job

Summary

Pros:

Cons:
