require "ostruct"

describe "Hash#zip" do
  it "zips itself" do
    a = {x: 1,
      y: 2, z: 3}
    expect(a.zip).to eq({
      x: [1], y: [2], z: [3]
    })
  end

  it "zips two Hashes" do
    a = {x: 1, y: 2, z: 3}
    b = {x: 4, z: 5, w: 6}
    expect(a.zip(b)).to eq({
      x: [1,4], y: [2,nil], z: [3,5], w: [nil,6]
    })
  end

  it "zips multiple Hashes, in source order" do
    a = {a: 1, ab: 2, ac: 3, abc: 4 }
    b = {b: 5, ab: 6, bc: 7, abc: 8 }
    c = {c: 9, ac: 10, bc: 11, abc: 12 }
    expect(a.zip(b, c)).to eq({
      # All 7 cobinations
      a:  [1,nil,nil],
      b:  [nil,5,nil],
      c:  [nil,nil,9],
      ab: [2,6,nil],
      ac: [3,nil,10],
      bc: [nil,7,11],
      abc: [4,8,12],
    })
    expect(a.zip(b, c).keys).to eq([
      :a, :ab, :ac, :abc, :b, :bc, :c
    ])
  end

  it "returns nil and yields for each item when passed a block" do
    a = {x: 1, y: 2, z: 3}
    b = {x: 4, z: 5, w: 6}
    calls = []
    expect(a.zip(b){|*args|
      calls << args
    }).to eq(nil)
    expect(calls).to eq([
      [:x, 1, 4],
      [:y, 2, nil],
      [:z, 3, 5],
      [:w, nil, 6],
    ])
  end

  it "converts other arguments to Hashes" do
    a = {x: 1, y: 2, z: 3}
    b = OpenStruct.new(x: 4, z: 5, w: 6)
    expect(a.zip(b)).to eq({
      x: [1,4], y: [2,nil], z: [3,5], w: [nil,6]
    })
  end

  it "allows ignoring nils" do
    a = {x: 1, y: 2}
    b = {x: 3, z: 4}
    expect(a.zip_compact(b)).to eq({
      x: [1,3], y: [2], z: [4]
    })
  end

  it "returns nil, yields for each compacted item when passed a block" do
    a = {x: 1, y: 2, z: 3}
    b = {x: 4, z: 5, w: 6}
    calls = []
    expect(a.zip_compact(b){|*args|
      calls << args
    }).to eq(nil)
    expect(calls).to eq([
      [:x, 1, 4],
      [:y, 2],
      [:z, 3, 5],
      [:w, 6],
    ])
  end
end
