import { CloudUpload } from '@mui/icons-material'
import { ChangeEvent, useEffect, useState } from 'react'
import '../styles/button.scss'
import '../styles/login.scss'
import { UserModel } from '../model/UserModel'
import { fetchProjectUserSubmission, postSubmission } from '../api/submissionsApi'
import { SubmissionModel } from '../model/SubmissionModel'

interface FileUploadProps {
  user: UserModel
  pID: number
}

export default function FileUpload({ user, pID }: FileUploadProps) {

    const [file, setFile] = useState<File | SubmissionModel | null>(null)

    useEffect(() => {
      const fetchSubmission = async () => {
        const userSubmission = await fetchProjectUserSubmission(pID, user.id)
        if(userSubmission && userSubmission.id !== -1)
          setFile(userSubmission)
        else
          setFile(null)
          
      }
      fetchSubmission()
    })

    const hasNotAcceptableExtensions = (targetFile: File) => {
      if (!targetFile.name.toLowerCase().endsWith('.js') &&
          !targetFile.name.toLowerCase().endsWith('.ts') &&
          !targetFile.name.toLowerCase().endsWith('.jsx') &&
          !targetFile.name.toLowerCase().endsWith('.tsx') &&
          !targetFile.name.toLowerCase().endsWith('.mjs') &&
          !targetFile.name.toLowerCase().endsWith('.cjs') &&
          !targetFile.name.toLowerCase().endsWith('.es') &&
          !targetFile.name.toLowerCase().endsWith('.es6') &&
          !targetFile.name.toLowerCase().endsWith('.coffee') &&
          !targetFile.name.toLowerCase().endsWith('.vue')) {
            return true
          }else
            return false

    }

    const handleFileChange = (e: ChangeEvent<HTMLInputElement>) => {
        if (e.target.files) {
          if (hasNotAcceptableExtensions(e.target.files[0])) {
            setFile(e.target.files[0])
            alert('Invalid file type. Please submit a valid file type.')
            return
          }else{
            setFile(e.target.files[0])
          }
        }
      }
    
    
      const handleUploadClick = async () => {
        if (!file || hasNotAcceptableExtensions(file as File)) {
          alert('Invalid file type. Please submit a valid file type.')
          return
        }
        const fileContents = await readFileContents(file as File)
        let submission = new SubmissionModel()
        submission.submitee_id = user.id
        submission.project_id = pID
        submission.code = fileContents
        await postSubmission(submission)
      }

      const handleDownloadClick = async () => {
        if (file instanceof SubmissionModel) {
          const fileContents = file.code;
          const blob = new Blob([fileContents], { type: 'text/plain' });
          const url = URL.createObjectURL(blob);
      
          const a = document.createElement('a');
          a.href = url;
          a.download = file.name || 'download.js';
          document.body.appendChild(a);
          a.click();
      
          document.body.removeChild(a);
          URL.revokeObjectURL(url);
        }
      };
      

    const readFileContents = (file: File): Promise<string> => {
      return new Promise((resolve, reject) => {        
        const reader = new FileReader()
    
        reader.onload = (event) => {
          const fileContents = event.target?.result?.toString()
          if (fileContents) {
            resolve(fileContents)
          } else {
            reject(new Error('Failed to read file contents.'))
          }
        }
    
        reader.onerror = (event) => {
          reject(new Error('Error reading file.'))
        }
    
        reader.readAsText(file)
      })
    }    

  return (
    <div className='row' style={{width: "90%", height: "90px", margin: "20px"}}>
        <label htmlFor="file-upload" className="file-upload column center">
            <div className="row" style={{backgroundColor: "white"}}>
                <CloudUpload style={{flex: 0.6, margin: "auto", marginRight: "10px"}}/>
                <span style={{flex: 3, margin: "auto"}}>Custom Upload</span>
            </div>
        </label>
        <input style={{display: "none"}} id="file-upload" type="file" accept=".js, .ts, .jsx, .tsx, .mjs, .cjs, .es, .es6, .coffee, .vue" onChange={handleFileChange}/>
        <div className='row' style={{backgroundColor: "white", minWidth: "400px", maxWidth: "400px"}}>
            <span className='column center' style={{backgroundColor: 'white', flex: 3}}>{file != null ? file && `${file.name.length > 20 ? file.name.slice(0, 40) + "..." : file.name}` : "No file selected"}</span>
            {file instanceof SubmissionModel ?
              <button className="button" style={{flex: 1, padding: "15px"}} onClick={handleDownloadClick}>Download my Submission</button>
            :
              <></>
        }
        </div>

        <button className="button" style={{padding: "15px"}} onClick={handleUploadClick}>Upload Submission</button>
    </div>    
  )
}
