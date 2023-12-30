import { fetchSubjectProjects } from "../api/projectsApi";
import { fetchProjectUserSubmission } from "../api/submissionsApi";
import { ProjectModel } from "./ProjectModel";

export interface ISubject {
    id: number;
    name: string;
    description: string;
    semester: number;
    projects: ProjectModel[];
    supervisorId: number;
    userGrade: number | null;
    averageGrade: number | null;
}

export class SubjectModel {
    id: number;
    name: string;
    description: string;
    semester: number;
    projects: ProjectModel[];
    supervisorId: number;
    userGrade: number | null;
    averageGrade: number | null;

    constructor(subject: ISubject = {} as ISubject) {
        this.id = subject.id
        this.name = subject.name
        this.description = subject.description
        this.semester = subject.semester
        this.projects = subject.projects ?? []
        this.supervisorId = subject.supervisorId
        this.userGrade = subject.userGrade
        this.averageGrade = subject.averageGrade
    }

    async setup(userId?: number, userRole?: number){
        const projects: ProjectModel[] | null = await fetchSubjectProjects(this.id)
        let gradeSum = 0
        let subjectsGraded = 0
        if(projects){
            for(const project of projects){
                if(userRole != undefined && userRole <= 1)
                    await project.setup()
                else{
                    await project.setup(userId)
                }

                if(userId){
                    const submission = await fetchProjectUserSubmission(project.id, userId)
                    if(submission && submission.grade != null){
                        gradeSum += submission.grade
                        subjectsGraded++
                    }
                }


            }
            this.projects = projects
            this.userGrade = isNaN(gradeSum / subjectsGraded) ? null : gradeSum / subjectsGraded
        }
    }
}
