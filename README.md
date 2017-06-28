Implements a much needed `Hash#zip` method.

## Usage

You can zip multiple Hashes. Keys in result will be keys in any of the inputs, and values will be Arrays with missing values padded by `nil`s.

```ruby
a = {x: 1, y: 2}
b = {y: 3, z: 4}
a.zip(b)
# returns {x: [1, nil], y: [2, 3], z: [nil, 4]}
```

You can also use it with a block. In such case the return value is `nil`:

```ruby
a = {x: 1, y: 2}
b = {y: 3, z: 4}
a.zip(b) do |key, value_a, value_b|
  p [key, value_a, value_b]
  # Yields [:x, 1, nil]
  #        [:y, 2, 3]
  #        [:z, nil, 4]
end
```

It works with more than one argument (`a.zip(b,c)`) as well as with zero arguments (`a.zip()`).

If arguments are not `Hash`es, but accept `to_h`, they will be converted automatically before zipping.
