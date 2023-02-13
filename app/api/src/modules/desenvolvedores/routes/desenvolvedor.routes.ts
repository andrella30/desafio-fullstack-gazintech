import { validate, validateOrReject } from "class-validator";
import { parseISO } from "date-fns";
import { Router } from "express";
import { body, validationResult } from "express-validator";
import { CreateDesenvolvedorDto } from "../services/create-desenvolvedor-dto";
import CreateDesenvolvedorService from "../services/create-desenvolvedor-service";
import DeleteDesenvolvedorService from "../services/delete-desenvolvedor-service";
import FindAllDesenvolvedorService from "../services/find-all-desenvolvedores-service";
import FindOneDesenvolvedorService from "../services/find-one-desenvolvedor-service";
import UpdateDesenvolvedorService from "../services/update-desenvolvedor-service";



const desenvolvedorRouter = Router();

desenvolvedorRouter.get('/', async (request, response) => {
    const findAllDesenvolvedorService = new FindAllDesenvolvedorService()
    const niveis = await findAllDesenvolvedorService.execute()

    return response.status(200).json(niveis)
})

desenvolvedorRouter.get('/:id', async (request, response) => {
    try {
        const {id} = request.params

        const parsedId = Number(id)

        const findOneDesenvolvedorService = new FindOneDesenvolvedorService()
        const readNivel = await findOneDesenvolvedorService.execute(parsedId)
    
        return response.status(200).json(readNivel)
        
    } catch (err: unknown) {
        if (err instanceof Error) {
            return response.status(400).json({ error: err.message})
        }
    }
})

desenvolvedorRouter.post('/',  async (request, response) => {
    try {
        const { nome, idade, hobby, sexo, dataNascimento, nivel} = request.body
       
        const parsedDate = parseISO(dataNascimento)
        
        const createDesenvolvedorDTO = new CreateDesenvolvedorDto()
        createDesenvolvedorDTO.nome = nome
        createDesenvolvedorDTO.idade = idade
        createDesenvolvedorDTO.hobby = hobby
        createDesenvolvedorDTO.sexo = sexo
        createDesenvolvedorDTO.dataNascimento = parsedDate
        createDesenvolvedorDTO.nivelId = nivel
 
        const createDesenvolvedorService = new CreateDesenvolvedorService()

        const desenvolvedor = await createDesenvolvedorService.execute(createDesenvolvedorDTO)
        
        return response.status(201).json(desenvolvedor)

    } catch (err: unknown) {
        if (err instanceof Error) {
            return response.status(400).json({ error: err.message})
        }
    }
    
})

desenvolvedorRouter.put('/:id', async (request,response) => {
    try {

        const { id } = request.params
        const { nome, idade, hobby, sexo, dataNascimento, nivel} = request.body 

        const parsedId = Number(id)
        const parsedIdNivel = Number(nivel)
        const parsedDate = parseISO(dataNascimento)

        const createDesenvolvedorDTO = new CreateDesenvolvedorDto()
        createDesenvolvedorDTO.nome = nome
        createDesenvolvedorDTO.idade = idade
        createDesenvolvedorDTO.hobby = hobby
        createDesenvolvedorDTO.sexo = sexo
        createDesenvolvedorDTO.dataNascimento = parsedDate
        createDesenvolvedorDTO.nivelId = nivel


        const updateNivelService = new UpdateDesenvolvedorService()

        const desenvolvedor = await updateNivelService.execute(parsedId, createDesenvolvedorDTO)
        return response.status(200).json(desenvolvedor)

    } catch (err: unknown) {
        if (err instanceof Error) {
            return response.status(400).json({ error: err.message})
        }
    }
})

desenvolvedorRouter.delete('/:id', async (request,response) => {
    try {
        const { id } = request.params   

        const parsedId = Number(id)
        const updateNivelService =  new DeleteDesenvolvedorService() //new DeleteNivelService()

        const currentNivelResponse = await updateNivelService.execute(parsedId)
        return response.status(200).json({message: currentNivelResponse})

    } catch (err: unknown) {
        if (err instanceof Error) {
            return response.status(400).json({ error: err.message})
        }
    }
})



// desenvolvedorRouter.delete('/:id', (request, response) => {
//     try {
//         const { id } = request.params
//         const parsedId = Number(id)
    
//         const deleteDesenvolvedorService = new DeleteDesenvolvedorService()
//         deleteDesenvolvedorService.execute(parsedId)

//         return response.status(201).send()

//     } catch (err: unknown) {
//         if (err instanceof Error) {
//             return response.status(400).json({ error: err.message}) 
//         }
//     }
// }) 
 

export default desenvolvedorRouter