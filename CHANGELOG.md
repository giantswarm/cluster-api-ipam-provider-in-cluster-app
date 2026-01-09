# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed

- Migrate to App Build Suite (ABS).

## [0.1.3] - 2025-12-09

### Changed

- Add `node-role.kubernetes.io/control-plane` toleration.

## [0.1.2] - 2025-10-23

### Changed

- Update renovate to json5 config.

### Fixed

- Add missing RBAC permission for `ipaddressclaims/finalizers` subresource required by `OwnerReferencesPermissionEnforcement` admission controller (enabled by default in Kubernetes 1.33+).

## [0.1.1] - 2024-05-22

### Changed

- Pull image from Azure CR.
- Fix typo in labels for netpols.

## [0.1.0] - 2023-10-31

## [0.0.12] - 2023-10-24

## [0.0.12] - 2023-10-24

### Added

- PSS compliance

## [0.0.12] - 2023-08-08

### Changed

- NetworkPolicy for webhooks allows anyone to talk to caip manager.

## [0.0.11] - 2023-07-27

### Added

- :seedling: GH action that verifies if `make all` was run (drift detection).
- :seedling: `sync-version.sh` now can sync also to a given git sha.

### Changed

- :boom: **Breaking:** Switched from api `v1alpha1` to `v1alpha2`. Using the latest unreleased version that has the GlobalInClusterIPPool cross-namespace functionality fixed.

## [0.0.10] - 2023-07-25

## [0.0.9] - 2023-07-13

## [0.0.8] - 2023-07-13

## [0.0.7] - 2023-07-13

### Added

- Network policy (cilium and normal) for webhooks.

## [0.0.6] - 2023-07-12

## [0.0.5] - 2023-07-11

## [0.0.4] - 2023-07-11

## [0.0.3] - 2023-07-04

### Added

- Network policy (cilium and normal) for manager.

## [0.0.2] - 2023-07-04

### Added

- Optionally create also the `InClusterIPPool` CR when installing the controller.

## [0.0.1] - 2023-06-27

### Added

- Add this app

[Unreleased]: https://github.com/giantswarm/cluster-api-ipam-provider-in-cluster-app/compare/v0.1.3...HEAD
[0.1.3]: https://github.com/giantswarm/cluster-api-ipam-provider-in-cluster-app/compare/v0.1.2...v0.1.3
[0.1.2]: https://github.com/giantswarm/cluster-api-ipam-provider-in-cluster-app/compare/v0.1.1...v0.1.2
[0.1.1]: https://github.com/giantswarm/cluster-api-ipam-provider-in-cluster-app/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/giantswarm/cluster-api-ipam-provider-in-cluster-app/compare/v0.0.12...v0.1.0
[0.0.12]: https://github.com/giantswarm/cluster-api-ipam-provider-in-cluster-app/compare/v0.0.12...v0.0.12
[0.0.12]: https://github.com/giantswarm/cluster-api-ipam-provider-in-cluster-app/compare/v0.0.12...v0.0.12
[0.0.12]: https://github.com/giantswarm/cluster-api-ipam-provider-in-cluster-app/compare/v0.0.11...v0.0.12
[0.0.11]: https://github.com/giantswarm/cluster-api-ipam-provider-in-cluster-app/compare/v0.0.10...v0.0.11
[0.0.10]: https://github.com/giantswarm/cluster-api-ipam-provider-in-cluster-app/compare/v0.0.9...v0.0.10
[0.0.9]: https://github.com/giantswarm/cluster-api-ipam-provider-in-cluster-app/compare/v0.0.8...v0.0.9
[0.0.8]: https://github.com/giantswarm/cluster-api-ipam-provider-in-cluster-app/compare/v0.0.7...v0.0.8
[0.0.7]: https://github.com/giantswarm/cluster-api-ipam-provider-in-cluster-app/compare/v0.0.6...v0.0.7
[0.0.6]: https://github.com/giantswarm/cluster-api-ipam-provider-in-cluster-app/compare/v0.0.5...v0.0.6
[0.0.5]: https://github.com/giantswarm/cluster-api-ipam-provider-in-cluster-app/compare/v0.0.4...v0.0.5
[0.0.4]: https://github.com/giantswarm/cluster-api-ipam-provider-in-cluster-app/compare/v0.0.3...v0.0.4
[0.0.3]: https://github.com/giantswarm/cluster-api-ipam-provider-in-cluster-app/compare/v0.0.2...v0.0.3
[0.0.2]: https://github.com/giantswarm/cluster-api-ipam-provider-in-cluster-app/compare/v0.0.1...v0.0.2
[0.0.1]: https://github.com/giantswarm/cluster-api-ipam-provider-in-cluster-app/compare/v0.0.1...v0.0.1
