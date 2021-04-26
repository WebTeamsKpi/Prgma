import { Controller, Get, Res, HttpStatus, Param, NotFoundException, Post, Body} from '@nestjs/common';
import { ValidateObjectId } from 'src/shared/pipes/validate-object-id.pipes';
import { AuthenticationService } from './authentication.service';
import { CreateUserDTO } from './dto/create-user.dto';


@Controller('authentication')
export class AuthenticationController {

    constructor(private authenticationService: AuthenticationService) { }

    @Get('users')
    async getUsers(@Res() res) {
        const users = await this.authenticationService.getUsers();
        return res.status(HttpStatus.OK).json(users);
    }

    @Get('user/:name/:password')
    async getUser(@Res() res, @Param('name') name, @Param('password') password) {
        const user = await this.authenticationService.getUser(name);
        console.log(name);
        console.log(password);
        if (!user) throw new NotFoundException('User does not exist!');
        if(user.password!=password) throw new NotFoundException('Wrong password!');
        return res.status(HttpStatus.OK).json(user);

    }

    @Post('/addUser')
    async addUser(@Res() res, @Body() createUserDTO: CreateUserDTO) {
        const newUser = await this.authenticationService.addUser(createUserDTO);
        
        return res.status(HttpStatus.OK).json({
            message: "User has been submitted successfully!",
            post: newUser
        })
    }
}