import { RouteType } from "./config";

import HomePage from "../pages/home";
import LoginPage from "../pages/login";

import { Class, Code } from "@mui/icons-material";
import Home from '@mui/icons-material/Home';
import NewProjectPage from "../pages/newProject";
import ProjectsPage from "../pages/projects";
import SubjectsPage from "../pages/subjects";
import SubmissionsPage from "../pages/submissions";

const appRoutes: RouteType[] = [
  {
    index: true,
    protected: 0,
    element: <LoginPage/>,
    path: "/"
  },
  {
    protected: 1,
    element: <HomePage/>,
    path: "/home",
    sidebarProps: {
      displayText: "Home",
      icon: <Home/>
    }
  },
  {
    protected: 1,
    element: <SubjectsPage/>,
    path: "/subjects",
    sidebarProps: {
      displayText: "Subjects",
      icon: <Class/>
    }
  },
  {
    protected: 1,
    element: <ProjectsPage/>,
    path: "/projects",
    sidebarProps: {
      displayText: "Projects",
      icon: <Code/>
    }
  },
  {
    protected: 2,
    element: <NewProjectPage/>,
    path: "/new-project"
  },
  {
    protected: 2,
    element: <SubmissionsPage/>,
    path: "/submissions"
  }
]

export default appRoutes;