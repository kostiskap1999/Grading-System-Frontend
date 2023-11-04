import { ISubmission, ISubmissionDefaults } from "../interfaces/iSubmission";
import { User } from "./user";

export class Submission {
    id: number;
    student?: User;
    code: string;
    date: Date;
    grade: number;
    comment: string;

    constructor({id, student, code, date, grade, comment}: ISubmission = ISubmissionDefaults) {
        this.id = id
        this.student = student
        this.code = code
        this.date = date
        this.grade = grade
        this.comment = comment
    }
}
