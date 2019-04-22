scenario "", js: true do
  foo = create(:foo)

  visit()

  expect(foo).to eq foo
end
