import { Router } from "express";
import DeleteDesenvolvedorService from "../../desenvolvedores/services/delete-desenvolvedor-service";
import UpdateDesenvolvedorService from "../../desenvolvedores/services/update-desenvolvedor-service";
import { Messages } from "../../shared/messages";
import CreateNivelService from "../services/create-nivel-service";
import DeleteNivelService from "../services/delete-nivel-service";
import FindAllNiveisService from "../services/find-all-service";
import FindOneNivelService from "../services/find-one-nivel-service";
import UpdateNivelService from "../services/update-nivel-service";


const niveisRouter = Router();


niveisRouter.get('/', async (request, response) => {
    const nivelRepository = new FindAllNiveisService()
    const niveis = await nivelRepository.execute()

    return response.status(200).json(niveis)
})


niveisRouter.get('/:id', async (request, response) => {
    try {
        const {id} = request.params

        const parsedId = Number(id)
        const readNivelService = new FindOneNivelService()
    
        const readNivel = await readNivelService.execute(parsedId)
    
        return response.status(200).json(readNivel)
    } catch (err: unknown) {
        if (err instanceof Error) {
            return response.status(400).json({ error: err.message})
        }
    }
})

niveisRouter.post('/', async (request, response) =>  {
    try {
        const { nivel } = request.body

        const nivelService = new CreateNivelService()

        const createNivel = await nivelService.execute({nivel})

        return response.status(201).json(createNivel)

    } catch (err: unknown) {
        if (err instanceof Error) {
            return response.status(400).json({ error: err.message})
        }
    }
}); 

niveisRouter.put('/:id', async (request,response) => {
    try {
        const { id } = request.params
        const {nivel} = request.body

        const parsedId = Number(id)
        const updateNivelService = new UpdateNivelService()

        const currentNivel = await updateNivelService.execute({
              id: parsedId,
              nivel: nivel
        })
        return response.status(200).json(currentNivel)

    } catch (err: unknown) {
        if (err instanceof Error) {
            return response.status(400).json({ error: err.message})
        }
    }
})

niveisRouter.delete('/:id', async (request,response) => {
    try {
        const { id } = request.params   

        const parsedId = Number(id)
        const updateNivelService =  new DeleteNivelService()

        const currentNivelResponse = await updateNivelService.execute(parsedId)
        return response.status(204).send()

    } catch (err: unknown) {
        if (err instanceof Error) {
            if (err.message === Messages.MESSAGE_NIVEL_ASSOCIATED)
                return response.status(501).json({ error: err.message })
            return response.status(400).json({ error: err.message })
        }
    }
})





export default niveisRouter