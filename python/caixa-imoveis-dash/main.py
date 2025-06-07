import dash
import dash_core_components as dcc
import dash_html_components as html
import dash_table
from dash.dependencies import Input, Output, State
import pandas as pd
import base64
import io

# Function to parse the uploaded CSV file
def parse_contents(contents):
    content_type, content_string = contents.split(",")
    decoded = base64.b64decode(content_string)
    try:
        # Read CSV with ISO-8859-1 encoding and semicolon separator
        df = pd.read_csv(io.StringIO(decoded.decode("iso-8859-1")), sep=";")
        # Convert necessary columns to appropriate data types
        df["Preço"] = (
            df["Preço"].str.replace(".", "").str.replace(",", ".").astype(float)
        )
        df["Valor de avaliação"] = (
            df["Valor de avaliação"]
            .str.replace(".", "")
            .str.replace(",", ".")
            .astype(float)
        )
        return df
    except Exception as e:
        print(e)
        return None


# Function to format currency columns
def format_currency_column(df, column_name):
    # df[column_name] = df[column_name].apply(
    #    lambda x: f"R$ {x:,.2f}".replace(",", "v").replace(".", ",").replace("v", ".")
    # )
    return df


# Load the CSV file at startup with ISO-8859-1 encoding
csv_file_path = "./imoveis.csv"
preloaded_df = pd.read_csv(csv_file_path, sep=";", encoding="iso-8859-1")
preloaded_df["Preço"] = (
    preloaded_df["Preço"].str.replace(".", "").str.replace(",", ".").astype(float)
)
preloaded_df["Valor de avaliação"] = (
    preloaded_df["Valor de avaliação"]
    .str.replace(".", "")
    .str.replace(",", ".")
    .astype(float)
)

# Encode the preloaded CSV content to base64
def encode_preloaded_csv(file_path):
    with open(file_path, "rb") as f:
        encoded = base64.b64encode(f.read()).decode()
    return f"data:text/csv;base64,{encoded}"


preloaded_content = encode_preloaded_csv(csv_file_path)

# Initialize the Dash app
app = dash.Dash(__name__)

app.layout = html.Div(
    [
        html.H1("Real Estate Listings"),
        dcc.Upload(
            id="upload-data",
            children=html.Div(["Drag and Drop or ", html.A("Select Files")]),
            style={
                "width": "100%",
                "height": "60px",
                "lineHeight": "60px",
                "borderWidth": "1px",
                "borderStyle": "dashed",
                "borderRadius": "5px",
                "textAlign": "center",
                "margin": "10px",
            },
            multiple=False,
        ),
        html.Div(id="output-data-upload"),
        html.Div(
            [
                html.Label("Filter by Cidade"),
                dcc.Checklist(
                    id="cidade-filter",
                    options=[
                        {"label": cidade, "value": cidade}
                        for cidade in preloaded_df["Cidade"].unique()
                    ],
                    value=[],
                    labelStyle={"display": "inline-block", "margin-bottom": "15px"},
                ),
            ]
        ),
        dash_table.DataTable(
            id="datatable",
            columns=[{"name": i, "id": i} for i in preloaded_df.columns],
            data=preloaded_df.to_dict("records"),
            filter_action="native",
            sort_action="native",
            page_action="native",
            page_size=60,
            style_cell={"textAlign": "left", "padding": "5px"},
            style_header={
                "backgroundColor": "rgb(230, 230, 230)",
                "fontWeight": "bold",
            },
        ),
    ]
)


@app.callback(
    [
        Output("datatable", "columns"),
        Output("datatable", "data"),
        Output("cidade-filter", "options"),
    ],
    [Input("upload-data", "contents"), Input("cidade-filter", "value")],
    [State("upload-data", "filename"), State("datatable", "data")],
)
def update_table(contents, selected_cidades, filename, current_data):
    if contents is None:
        df = preloaded_df.copy()
    else:
        df = parse_contents(contents)
        if df is None:
            return [], [], []

    df = format_currency_column(df, "Preço")
    df = format_currency_column(df, "Valor de avaliação")

    columns = [{"name": i, "id": i} for i in df.columns]
    cidade_options = [
        {"label": cidade, "value": cidade} for cidade in df["Cidade"].unique()
    ]

    if selected_cidades:
        df = df[df["Cidade"].isin(selected_cidades)]

    data = df.to_dict("records")
    return columns, data, cidade_options


if __name__ == "__main__":
    app.run_server(host="0.0.0.0", port=8050, debug=True)
