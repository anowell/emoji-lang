# emoji_lang.rb

[EmojiLang](https://github.com/anowell/emoji-lang) on top of any Ruby Virtual Machine.

## INSTALLATION

    gem install emoji_lang

## USAGE

```ruby
$ emojit my_script.emoj
```

Example: [fizzbuzz](samples/fizzbuzz.emoj)
```
$ cat samples/fizzbuzz.emoj
🚌
  ✉🖘1
  🏃 ✉ 🐁❤ 100
    😸 ✉💣15 ❤ 0
      🖊 "fizzbuzz"
    😼 ✉💣3 ❤ 0
      🖊 "fizz"
    😼 ✉💣5 ❤ 0
      🖊 "buzz"
    😾
      🖊 ✉
    🙀
    ✉💪1
  🚶
🎓
$ emjojit samples/fizzbuzz.emoj
1
2
fizz
4
buzz
fizz
7
8
fizz
buzz
11
fizz
13
14
fizzbuzz
...
```

You can turn on debug mode by using the -w option of the Ruby VM:

```ruby
$ ruby -w bin/emojit samples/HelloWorld.emoj
L0000: def main
L0001:   puts "hello word"
L0002: end
L0003: main
hello word
```

----------

Implementation derived heavily from [franckverrot/arnoldc.rb](https://github.com/franckverrot/arnoldc.rb)