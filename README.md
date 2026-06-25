# Affine Algebra Primitives

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

The abelian-group witness that equips `Affine.Discrete.Vector` with its additive group structure, bridging the `Affine` and `Algebra` primitive namespaces.

---

## Quick Start

`Affine.Discrete.Vector` (from `swift-affine-primitives`) is a signed displacement in discrete affine space; `Algebra.Group` (from `swift-algebra-primitives`) is the abstract group witness. Neither package knows about the other. This package is the single seam between them: it supplies `Affine.Discrete.Vector.group`, the abelian group `(ℤ, +, 0, −)` the vectors already satisfy, packaged as a witness an algorithm generic over `Algebra.Group` can consume.

```swift
import Affine_Algebra_Primitives

// Discrete displacement vectors form an abelian group under addition.
let group = Affine.Discrete.Vector.group

let a: Affine.Discrete.Vector = 3
let b: Affine.Discrete.Vector = -5

// Reach for the witness wherever code is generic over `Algebra.Group`:
let sum = group.combining(a, b)   // a + b  == Vector(-2)
let neg = group.inverting(a)      // -a     == Vector(-3)
let id = group.identity           // .zero

// The group laws the witness asserts:
print(group.combining(a, group.inverting(a)) == group.identity)  // true  (inverse)
print(group.combining(id, a) == a)                               // true  (identity)
print(group.combining(a, b) == group.combining(b, a))            // true  (commutativity)
```

Importing `Affine_Algebra_Primitives` re-exports both `Affine_Primitives` and `Algebra_Group_Primitives`, so `Affine.Discrete.Vector` and `Algebra.Group` are in scope from the single import.

---

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/swift-primitives/swift-affine-algebra-primitives.git", branch: "main")
]
```

```swift
.target(
    name: "App",
    dependencies: [
        .product(name: "Affine Algebra Primitives", package: "swift-affine-algebra-primitives"),
    ]
)
```

Requires Swift 6.3.1 and macOS 26 / iOS 26 / tvOS 26 / watchOS 26 / visionOS 26 (or the matching Linux / Windows toolchain).

---

## Architecture

Two library products. Depends only on `swift-affine-primitives` (the `Affine` namespace) and `swift-algebra-primitives` (the `Algebra.Group` witness).

| Product | Target | Purpose |
|---------|--------|---------|
| `Affine Algebra Primitives` | `Sources/Affine Algebra Primitives/` | The `Affine.Discrete.Vector.group` witness: the abelian group `(ℤ, +, 0, −)` over discrete affine vectors, re-exporting `Affine_Primitives` and `Algebra_Group_Primitives`. |
| `Affine Algebra Primitives Test Support` | `Tests/Support/` | Re-exports the main target for test consumers. |

Foundation-free.

---

## Platform Support

| Platform | Status |
|----------|--------|
| macOS 26 | Full support |
| Linux | Full support |
| Windows | Full support |
| iOS / tvOS / watchOS / visionOS | Supported |

---

## Community

<!-- BEGIN: discussion -->
<!-- Discussion thread created at publication. -->
<!-- END: discussion -->

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
