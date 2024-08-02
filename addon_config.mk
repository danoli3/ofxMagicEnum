# All variables and this file are optional, if they are not present the PG and the
# makefiles will try to parse the correct values from the file system.
#
# Variables that specify exclusions can use % as a wildcard to specify that anything in
# that position will match. A partial path can also be specified to, for example, exclude
# a whole folder from the parsed paths from the file system
#
# Variables can be specified using = or +=
# = will clear the contents of that variable both specified from the file or the ones parsed
# from the file system
# += will add the values to the previous ones in the file or the ones parsed from the file
# system
#
# The PG can be used to detect errors in this file, just create a new project with this addon
# and the PG will write to the console the kind of error and in which line it is
# ofxMagicEnum

## C++23 enum to std::string - std::string to enum - Magic Enum Converter Wrapper for openFrameworks 

# Turn any enum Type {
# 	INTO_STRINGS_YAY
# }

# Type intoStringType = ofxMagicEnum::cast<Type>("INTO_STRINGS_YAY");

# And back again 
# std::string stringYAY = ofxMagicEnum::toString<Type>(Type::INTO_STRINGS_YAY);


# Powered by Magic_Enum and C++17! this is really showing the future power of the CPP Language 

# MIT:
# https://github.com/Neargye/magic_enum


# # Changelog
# # v.0.0.1 - Init

meta:
	ADDON_NAME = ofxMagicCast
	ADDON_DESCRIPTION = C++23 enum to std::string - std::string to enum - Magic Enum Converter Wrapper for openFrameworks
	ADDON_AUTHOR = OF Team
	ADDON_TAGS = "enum" "magic" "converter"
	ADDON_URL = https://github.com/danoli3/ofxMagicEnum

common:


