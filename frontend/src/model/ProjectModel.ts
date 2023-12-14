import { fetchProjectUserSubmission, fetchSubmissions } from "../api/submissionsApi";
import { fetchTests } from "../api/testsApi";
import { IProject, IProjectDefaults } from "../interfaces/iProject";
import { SubmissionModel } from "./SubmissionModel";
import { TestModel } from "./TestModel";

export class ProjectModel {
    id: number;
    name: string;
    description: string;
    deadline: Date | string;
    submissions: SubmissionModel[];
    tests: TestModel[]
    subjectID: number | null;

    constructor({id, name, description, deadline, submissions, tests}: IProject = IProjectDefaults) {
        this.id = id
        this.name = name
        this.description = description
        this.deadline = deadline
        this.submissions = submissions
        this.tests = tests

        // only used in posting
        this.subjectID = null
    }

    async setup(userID?: number){
        if(!userID){ //userID is given only when setting up student
            this.tests = await fetchTests(this.id) ?? this.tests
            this.submissions = await fetchSubmissions(this.id) ?? this.submissions
        }else{
            const submission = await fetchProjectUserSubmission(this.id, userID) 
            if(submission){
                this.submissions = []
                this.submissions.push(submission)
            }
                
        }
    }

    getUserSubmission(userID: number) {
        for (const submission of this.submissions)
            if(submission.submitee_id == userID)
                return submission
    }   

}
