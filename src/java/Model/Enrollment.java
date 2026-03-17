package Model;
import Model.Enum.EnrollmentStatus;
import lombok.*;
import lombok.experimental.SuperBuilder;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder
@ToString(callSuper = true)
public class Enrollment extends BaseModel {
    private User student;
    private Integer classId;
    private LocalDateTime enrolledAt;
    private EnrollmentStatus status;
    private Integer paid;
}