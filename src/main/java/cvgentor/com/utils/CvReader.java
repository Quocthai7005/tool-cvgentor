package cvgentor.com.utils;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

public class CvReader {

    private static final String ERR_READ_FILE = "Cannot read file";

    public static String htmlReader(String path) {
        String html = null;
        Path fileName = Path.of(path);
        try {
            html = Files.readString(fileName);
        } catch (IOException e) {
            html = ERR_READ_FILE;
        }
        return html;
    }
}
