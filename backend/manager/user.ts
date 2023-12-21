import { BadRequestError, NotFoundError } from '../errors/errorTypes'
import { UserRepository } from '../persistence/repository/user'
import * as dbtoken from './token'
import { TransactionManager } from './transaction'

export class UserManager {

  repository: UserRepository

  constructor(tm: TransactionManager) {
    this.repository = new UserRepository(tm);
  }

  async login({username, password}: {username?: string, password?: string}) {
    if (!username || !password) 
      throw new BadRequestError("Incorrect username or password")
    
    const user = await this.repository.findUserByCredentials(username, password)
  
    if(!user)
      throw new NotFoundError("User not found")
  
    const token = await dbtoken.createToken({userId: user.id, role: user.role})
    
    return {user, token}
  }

  async getUser(id: number, token: string) {
    await dbtoken.checkToken(token)
    
    if (!id)
      throw new BadRequestError("Incorrect user id")
    
    const user = await this.repository.findById(id)
  
    if(!user)
      throw new NotFoundError("User not found")
    
    return user
  }
}
