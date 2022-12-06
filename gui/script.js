let orderby_field = 'Promedio'
let type_field = 'DESC'

const renderizar_tabla = async () => {
    const tabla = document.querySelector(".table")
    tabla.innerHTML = `<p class="table-header">Identificación</p>
    <p class="table-header">Nombre</p>
    <p class="table-header">Apellido</p>
    <p class="table-header">Materias tomadas</p>
    <p class="table-header">Creditos acumulados</p>
    <p class="table-header">Promedio</p>`
    const response = await eel.consultar_clasificacion_general(orderby_field,type_field)()
    const flatResponse = response.flat()
    let newEntries = []
    flatResponse.map(element => {
        const paragraph = document.createElement('p')
        paragraph.textContent = element
        newEntries.push(paragraph)
    })
    tabla.append(... newEntries)
    console.log(response);
}

const orderby = document.querySelector('#orderby')
orderby.addEventListener('input', (e) => {
    switch (e.target.id) {
        case "identificacion":
            orderby_field = "Identificación"
            break;
        case "nombre":
            orderby_field = "Nombre"
            break;
        case "apellido":
            orderby_field = "Apellido"
            break;
            case "materias_tomadas":
                orderby_field = "Cantidad de materias tomadas"
                break;
                case "creditos_acumulados":
                    orderby_field = "Cantidad de créditos acumulados"
                    break;
                    case "promedio":
            orderby_field = "Promedio"
            break;
        default:
            orderby_field = "Promedio"
            break;
        }
        renderizar_tabla(orderby_field, type_field)
    })

const type = document.querySelector('#type')
type.addEventListener('input', (e) => {
    switch (e.target.id) {
        case "ascendente":
            type_field = "ASC"
            break;
        case "descendente":
            type_field = "DESC"
            break;
    
        default:
            break;
    }
    renderizar_tabla(orderby_field, type_field)
})

renderizar_tabla(orderby_field, type_field)