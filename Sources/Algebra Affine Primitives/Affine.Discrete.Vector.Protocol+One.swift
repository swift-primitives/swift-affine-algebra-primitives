// Affine.Discrete.Vector.Protocol+One.swift

/// Unit vector (displacement of 1) for vector protocol conformers.
///
/// Provided at the algebra layer because `.one` is a ring/module concept
/// (unit element for scalar action), not a fundamental affine concept.
/// The additive identity `.zero` lives at the affine layer.
///
/// Both `Affine.Discrete.Vector` and `Tagged<Tag, Vector>` (i.e., `Offset`)
/// receive `.one` through protocol conformance when this module is imported.
extension Affine.Discrete.Vector.`Protocol` {
    /// The unit vector (displacement of 1).
    @inlinable
    public static var one: Self { Self(Affine.Discrete.Vector(1)) }
}
