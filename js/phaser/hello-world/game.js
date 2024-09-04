const config = {
    type: Phaser.AUTO,
    width: 800,
    height: 600,
    scene: {
        preload: preload,
        create: create,
        update: update
    }
};

const game = new Phaser.Game(config);

function preload() {
    // No assets to preload
}

function create() {
    const fullText = 'Hello, World!';
    const letterSpacing = 32; // Adjust based on font size

    // Create an array to hold the individual letter text objects
    this.letters = [];

    // Create individual letter text objects
    for (let i = 0; i < fullText.length; i++) {
        const char = fullText[i];
        const letter = this.add.text(
            400 - (fullText.length / 2 * letterSpacing) + (i * letterSpacing), // Centering the text
            300,
            char,
            {
                fontSize: '64px',
                fill: '#ffffff',
                fontFamily: 'Arial'
            }
        ).setOrigin(0.5);

        this.letters.push(letter);
    }

    // Set up wobble effect
    this.time.addEvent({
        delay: 50,
        loop: true,
        callback: () => {
            let t = this.time.now / 1000;
            this.letters.forEach((letter, index) => {
                let xOffset = Math.sin(t + index) * 10;
                let yOffset = Math.cos(t + index) * 10;
                letter.setPosition(
                    400 - (fullText.length / 2 * letterSpacing) + (index * letterSpacing) + xOffset,
                    300 + yOffset
                );
            });
        }
    });
}

function update() {
    // Update logic if needed
}

