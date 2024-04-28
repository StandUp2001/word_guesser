import os
import requests


def read_file(words, file_name):
    print(f"Reading file, {file_name}")
    full_path = os.path.join(os.path.dirname(__file__), file_name)
    with open(full_path) as file:
        word = ""
        for letter in file.read():
            if letter.isalpha():
                word += letter
            elif word:
                if is_valid(words, word):
                    words.append(word.lower())
                word = ""
        if word and is_valid(words, word):
            words.append(word.lower())
    return words


def call_api(words, url):
    response = requests.get(url)
    if response.status_code != 200:
        print("Error")
        return words

    data = response.json()
    for word in data["data"]:
        used_word = word["name"]
        if is_valid(words, used_word):
            words.append(used_word.lower())
    return words


def is_valid(words, word):
    return (
        word.isalpha()
        and len(word) > 3
        and len(word) < 30
        and word.lower() not in words
    )


PROJECT_ROOT = "/home/stan/Code/Projects/word_guesser"


def main():
    words = []

    # get all words from txt files in the folder
    for file_name in os.listdir(os.path.join(PROJECT_ROOT, "words")):
        if file_name.endswith(".txt"):
            words = read_file(words, file_name)

    # Save the words to a dart file and make it so that it can be imported in dart
    file_path = os.path.join(PROJECT_ROOT, "lib", "words.dart")

    print(f"Saving words to {file_path}")
    with open(file_path, "w") as file:
        file.write("List<String> wordsList = [")
        for word in words:
            file.write(f'"{word}", ')
        file.write("];")

    print(f"Done, Wrote {len(words)} words")


if __name__ == "__main__":
    main()
