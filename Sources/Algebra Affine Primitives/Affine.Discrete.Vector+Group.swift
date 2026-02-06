// Affine.Discrete.Vector+Group.swift

/// Abelian group witness for Affine.Discrete.Vector under addition.
///
/// Discrete vectors form an abelian group (ℤ, +, 0, −):
/// - Identity: `.zero`
/// - Operation: addition (`+`)
/// - Inverse: negation (prefix `-`)
/// - Commutativity: a + b = b + a
extension Affine.Discrete.Vector {
    @inlinable
    public static var group: Algebra.Group<Self>.Abelian {
        .init(group: .init(
            identity: .zero,
            combining: { $0 + $1 },
            inverting: { -$0 }
        ))
    }
}
