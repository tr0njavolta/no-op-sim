# Upbound Simulations

This repository is the companion to the Upbound Simulations guide. Clone this
repository and follow along to learn how to use this feature.

## What are Simulations?

Simulations are short-lived copies of a control plane that allow you to see the
impact of a change to your resources before applying them to your actual
environment.

## Simulations QuickStart

1. Clone this repository:

```shell
git clone https://github.com/tr0njavolta/no-op-sim.git && cd no-op-sim
```

2. Build and deploy the base control plane you want to simulate:

```
up project build
up project run
```

Set your context to your control plane:

```
up ctx
```

```
kubectl apply -f examples/noop/example-xr.yaml
```

3. Simulate a change

Edit `examples/noop/example-xr.yaml`:

  * Comment out line 11:

  ```yaml
  #ultimateAnswer: 41
  ```

  * Uncomment line 12:

  ```yaml
  ultimateAnswer: 42
  ```

Set your context to the group level:

```
up ctx ..
```

Run the simulation:

```shell
up alpha ctp simulate noop --changeset=./examples/noop/example-xr.yaml --complete-after=60s --terminate-on-finish
```

4. Review the simulation results.


## Limitations

- Simulations is in private preview
- Time is the only completion criteria currently supported. Time-completion is
  determined by the `--complete-after` flag
- Providers don't run in simulations

## Learn More

More documentation is available on the Upbound Docs.
