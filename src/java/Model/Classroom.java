package Model;
import lombok.*;
import lombok.experimental.SuperBuilder;
import java.math.BigDecimal;
import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder
public class Classroom extends BaseModel {
    private String className;
    private Level level;
    private User teacher;
    private BigDecimal tuitionFee;
    private Integer maxStudents;
    private LocalDate startDate;
    private LocalDate endDate;

}