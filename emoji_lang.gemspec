# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "emoji_lang"
  spec.version       = "0.1.0"
  spec.authors       = ["Anthony Nowell"]
  spec.email         = ["anowell@gmail.com"]
  spec.summary       = %q{Emoji Lang Ruby implementation}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/anowell/emoji-lang"
  spec.license       = "GPLv3"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }

  spec.add_development_dependency "bundler", "~> 1.5"
end
