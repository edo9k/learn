import json
from manim import *

class CodeExamples(Scene):
    def construct(self):
        # Load code examples from a JSON file
        with open("code_examples.json", "r") as f:
            code_examples = json.load(f)


        # Create a list to hold the Code objects and highlight text
        code_objects = []
        highlights = []
        language_labels = []

        # Iterate through the dictionary and create code objects
        for lang, code in code_examples.items():
            # Create a Code object for each language
            code_object = Code(
                code=code,
                language=lang,
                tab_width=4,
                background="window",
                font="Monospace",
                style="monokai"
            )
            code_objects.append(code_object)

            # Add highlight decoration
            highlight = Text(f"{lang} Code", color=YELLOW).scale(0.7).next_to(code_object, UP)

            highlights.append(highlight)

        # Display each code example with its highlight and label
        for code_object, highlight in zip(code_objects, highlights):
            self.play(Create(code_object))
            self.play(Write(highlight))

            self.wait(3)  # Wait for 3 seconds to display each example

            # Fade out the current code, highlight, and language label before showing the next one
            self.play(FadeOut(code_object), FadeOut(highlight))

        self.wait(2)  # Wait before finishing the scene

