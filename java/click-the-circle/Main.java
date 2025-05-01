import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.util.Random;

public class Main extends JPanel implements ActionListener, MouseListener {
    private int x = 50, y = 50, radius = 30, score = 0;
    private final Timer timer = new Timer(1000, this);
    private final Random rand = new Random();

    public Main() {
        setPreferredSize(new Dimension(400, 400));
        setBackground(Color.BLACK);
        addMouseListener(this);
        timer.start();
    }

    public void paintComponent(Graphics g) {
        super.paintComponent(g);
        g.setColor(Color.GREEN);
        g.fillOval(x - radius, y - radius, radius * 2, radius * 2);
        g.setColor(Color.WHITE);
        g.drawString("Score: " + score, 10, 20);
    }

    public void actionPerformed(ActionEvent e) {
        x = rand.nextInt(getWidth() - 2 * radius) + radius;
        y = rand.nextInt(getHeight() - 2 * radius) + radius;
        repaint();
    }

    public void mousePressed(MouseEvent e) {
        int dx = e.getX() - x;
        int dy = e.getY() - y;

	// if the click coordenates are inside the cicle, increase the score by one.
        if (dx * dx + dy * dy <= radius * radius) {	
            score++;
            repaint();
        }
    }

    public void mouseReleased(MouseEvent e) {}
    public void mouseClicked(MouseEvent e) {}
    public void mouseEntered(MouseEvent e) {}
    public void mouseExited(MouseEvent e) {}

    public static void main(String[] args) {
        JFrame frame = new JFrame("Click the Circle!");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setContentPane(new Main());
        frame.pack();
        frame.setResizable(false);
        frame.setLocationRelativeTo(null);
        frame.setVisible(true);
    }
}

