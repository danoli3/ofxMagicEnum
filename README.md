### ofxMagicEnum

# Magic Enum Converter Wrapper for openFrameworks 

## C++17 enum to ```std::string``` to ``enum``` type 


```
Turn any enum Type {
	INTO_STRINGS_YAY
}
```
```Type intoStringType = ofxMagicEnum::cast<Type>("INTO_STRINGS_YAY");```

And back again 
```std::string stringYAY = ofxMagicEnum::toString<Type>(Type::INTO_STRINGS_YAY);```

Powered by Magic_Enum and C++17! this is really showing the future power of the CPP Language 

## Compiler Requirements
Clang/LLVM >= 5
MSVC++ >= 14.11 / Visual Studio >= 2017
Xcode >= 10
GCC >= 9
MinGW >= 9


## [Features & Examples](example/)

* Enum value to string

  ```cpp
  Color color = Color::RED;
  auto color_name = magic_enum::enum_name(color);
  // color_name -> "RED"
  ```

* String to enum value

  ```cpp
  std::string color_name{"GREEN"};
  auto color = magic_enum::enum_cast<Color>(color_name);
  if (color.has_value()) {
    // color.value() -> Color::GREEN
  }

  // case insensitive enum_cast
  auto color = magic_enum::enum_cast<Color>(value, magic_enum::case_insensitive);

  // enum_cast with BinaryPredicate
  auto color = magic_enum::enum_cast<Color>(value, [](char lhs, char rhs) { return std::tolower(lhs) == std::tolower(rhs); }

  // enum_cast with default
  auto color_or_default = magic_enum::enum_cast<Color>(value).value_or(Color::NONE);
  ```

* Integer to enum value

  ```cpp
  int color_integer = 2;
  auto color = magic_enum::enum_cast<Color>(color_integer);
  if (color.has_value()) {
    // color.value() -> Color::BLUE
  }

  auto color_or_default = magic_enum::enum_cast<Color>(value).value_or(Color::NONE);
  ```

* Indexed access to enum value

  ```cpp
  std::size_t i = 0;
  Color color = magic_enum::enum_value<Color>(i);
  // color -> Color::RED
  ```

* Enum value sequence

  ```cpp
  constexpr auto colors = magic_enum::enum_values<Color>();
  // colors -> {Color::RED, Color::BLUE, Color::GREEN}
  // colors[0] -> Color::RED
  ```

* Number of enum elements

  ```cpp
  constexpr std::size_t color_count = magic_enum::enum_count<Color>();
  // color_count -> 3
  ```

* Enum value to integer

  ```cpp
  Color color = Color::RED;
  auto color_integer = magic_enum::enum_integer(color); // or magic_enum::enum_underlying(color);
  // color_integer -> 1
  ```

* Enum names sequence

  ```cpp
  constexpr auto color_names = magic_enum::enum_names<Color>();
  // color_names -> {"RED", "BLUE", "GREEN"}
  // color_names[0] -> "RED"
  ```

* Enum entries sequence

  ```cpp
  constexpr auto color_entries = magic_enum::enum_entries<Color>();
  // color_entries -> {{Color::RED, "RED"}, {Color::BLUE, "BLUE"}, {Color::GREEN, "GREEN"}}
  // color_entries[0].first -> Color::RED
  // color_entries[0].second -> "RED"
  ```


* Enum fusion for multi-level switch/case statements

  ```cpp
  switch (magic_enum::enum_fuse(color, direction).value()) {
    case magic_enum::enum_fuse(Color::RED, Directions::Up).value(): // ...
    case magic_enum::enum_fuse(Color::BLUE, Directions::Down).value(): // ...
  // ...
  }
  ```

* Enum switch runtime value as constexpr constant
  ```cpp
  Color color = Color::RED;
  magic_enum::enum_switch([] (auto val) {
    constexpr Color c_color = val;
    // ...
  }, color);
  ```

* Enum iterate for each enum as constexpr constant
  ```cpp
  magic_enum::enum_for_each<Color>([] (auto val) {
    constexpr Color c_color = val;
    // ...
  });
  ```

* Check if enum contains

  ```cpp
  magic_enum::enum_contains(Color::GREEN); // -> true
  magic_enum::enum_contains<Color>(2); // -> true
  magic_enum::enum_contains<Color>(123); // -> false
  magic_enum::enum_contains<Color>("GREEN"); // -> true
  magic_enum::enum_contains<Color>("fda"); // -> false
  ```

* Enum index in sequence

  ```cpp
  constexpr auto color_index = magic_enum::enum_index(Color::BLUE);
  // color_index.value() -> 1
  // color_index.has_value() -> true
  ```

* Functions for flags

  ```cpp
  enum Directions : std::uint64_t {
    Left = 1,
    Down = 2,
    Up = 4,
    Right = 8,
  };
  template <>
  struct magic_enum::customize::enum_range<Directions> {
    static constexpr bool is_flags = true;
  };

  magic_enum::enum_flags_name(Directions::Up | Directions::Right); // -> "Directions::Up|Directions::Right"
  magic_enum::enum_flags_contains(Directions::Up | Directions::Right); // -> true
  magic_enum::enum_flags_cast(3); // -> "Directions::Left|Directions::Down"
  ```

* Enum type name

  ```cpp
  Color color = Color::RED;
  auto type_name = magic_enum::enum_type_name<decltype(color)>();
  // type_name -> "Color"
  ```

* IOstream operator for enum

  ```cpp
  using magic_enum::iostream_operators::operator<<; // out-of-the-box ostream operators for enums.
  Color color = Color::BLUE;
  std::cout << color << std::endl; // "BLUE"
  ```

  ```cpp
  using magic_enum::iostream_operators::operator>>; // out-of-the-box istream operators for enums.
  Color color;
  std::cin >> color;
  ```

* Bitwise operator for enum

  ```cpp
  enum class Flags { A = 1 << 0, B = 1 << 1, C = 1 << 2, D = 1 << 3 };
  using namespace magic_enum::bitwise_operators; // out-of-the-box bitwise operators for enums.
  // Support operators: ~, |, &, ^, |=, &=, ^=.
  Flags flags = Flags::A | Flags::B & ~Flags::C;
  ```

* Checks whether type is an [Unscoped enumeration](https://en.cppreference.com/w/cpp/language/enum#Unscoped_enumeration).

  ```cpp
  enum color { red, green, blue };
  enum class direction { left, right };

  magic_enum::is_unscoped_enum<color>::value -> true
  magic_enum::is_unscoped_enum<direction>::value -> false
  magic_enum::is_unscoped_enum<int>::value -> false

  // Helper variable template.
  magic_enum::is_unscoped_enum_v<color> -> true
  ```

* Checks whether type is an [Scoped enumeration](https://en.cppreference.com/w/cpp/language/enum#Scoped_enumerations).

  ```cpp
  enum color { red, green, blue };
  enum class direction { left, right };

  magic_enum::is_scoped_enum<color>::value -> false
  magic_enum::is_scoped_enum<direction>::value -> true
  magic_enum::is_scoped_enum<int>::value -> false

  // Helper variable template.
  magic_enum::is_scoped_enum_v<direction> -> true
  ```

* Static storage enum variable to string
  This version is much lighter on the compile times and is not restricted to the enum_range [limitation](doc/limitations.md).

  ```cpp
  constexpr Color color = Color::BLUE;
  constexpr auto color_name = magic_enum::enum_name<color>();
  // color_name -> "BLUE"
  ```

* `containers::array` array container for enums.

  ```cpp
  magic_enum::containers::array<Color, RGB> color_rgb_array {};
  color_rgb_array[Color::RED] = {255, 0, 0};
  color_rgb_array[Color::GREEN] = {0, 255, 0};
  color_rgb_array[Color::BLUE] = {0, 0, 255};
  magic_enum::containers::get<Color::BLUE>(color_rgb_array) // -> RGB{0, 0, 255}
  ```

* `containers::bitset` bitset container for enums.

  ```cpp
  constexpr magic_enum::containers::bitset<Color> color_bitset_red_green {Color::RED|Color::GREEN};
  bool all = color_bitset_red_green.all();
  // all -> false
  // Color::BLUE is missing
  bool test = color_bitset_red_green.test(Color::RED);
  // test -> true
  ```

* `containers::set` set container for enums.

  ```cpp
  auto color_set = magic_enum::containers::set<Color>();
  bool empty = color_set.empty();
  // empty -> true
  color_set.insert(Color::GREEN);
  color_set.insert(Color::BLUE);
  color_set.insert(Color::RED);
  std::size_t size = color_set.size();
  // size -> 3
  ```

* Improved UB-free "SFINAE-friendly" [underlying_type](https://en.cppreference.com/w/cpp/types/underlying_type).

  ```cpp
  magic_enum::underlying_type<color>::type -> int

  // Helper types.
  magic_enum::underlying_type_t<Direction> -> int
  ```

## More Info:
https://github.com/danoli3/ofxMagicEnum/tree/main/lib/magic_enum/include

## License 
MIT https://github.com/danoli3/ofxMagicEnum/blob/main/LICENSE

# Upstream Library
https://github.com/Neargye/magic_enum

# Changelog
## v.0.9.6 
- Updated to ofxAddon standards
- Updated to magicEnum 0.9.6
## v.0.7.3
- Init magicEnum 0.7.3