import com.ayush.testing.MathUtils;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

public class MathUtilsTest {

    private MathUtils mathUtils;

    @Before
    public void setUp() {
        // Setup - runs before each test
        mathUtils = new MathUtils();
        System.out.println("Test setup completed.");
    }

    @After
    public void tearDown() {
        // Teardown - runs after each test
        System.out.println("Test teardown completed.");
    }

    @Test
    public void testMultiply() {
        // Arrange
        int a = 5;
        int b = 4;

        // Act
        int result = mathUtils.multiply(a, b);

        // Assert
        assertEquals(20, result);
    }

    @Test
    public void testDivide() {
        // Arrange
        int a = 10;
        int b = 2;

        // Act
        int result = mathUtils.divide(a, b);

        // Assert
        assertEquals(5, result);
    }
}
