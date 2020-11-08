import { makeStyles } from '@material-ui/core/styles'
import AppBar from '@material-ui/core/AppBar'
import Toolbar from '@material-ui/core/Toolbar'
import Typography from '@material-ui/core/Typography'
import Box from '@material-ui/core/Box'
import Container from '@material-ui/core/Container'
import Grid from '@material-ui/core/Grid'
import Card from '@material-ui/core/Card'
import CardActionArea from '@material-ui/core/CardActionArea'
import CardActions from '@material-ui/core/CardActions'
import CardMedia from '@material-ui/core/CardMedia'
import CardContent from '@material-ui/core/CardContent'
import Avatar from '@material-ui/core/Avatar'
import BookmarkBorderIcon from '@material-ui/icons/BookmarkBorder'
import Pagination from '@material-ui/lab/Pagination'

const useStyles = makeStyles((theme) => ({
  appBar: {
    backgroundColor: "#fff"
  },
  hero: {
    backgroundImage: `linear-gradient(rgba(0, 0, 0, .5), rgba(0, 0, 0, .5)), url('https://place-puppy.com/500x500')`,
    height: '500px',
    backgroundPosition: 'center',
    backgroundRepeat: 'no-repeat',
    backgroundSize: 'cover',
    position: 'relative',
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center',
    color: '#fff',
    fontSize: '4rem',
    [theme.breakpoints.down('sm')]: {
      height: 300,
      fontSize: '3em'
    }
  },
  blogsContainer: {
    paddingTop: theme.spacing(3),

  },
  blogTitle: {
    fontWeight: 800,
    paddingBottom: theme.spacing(3)
  },
  card: {
    maxWidth: '100%',
  },
  media: {
    height: 240
  },
  cardActions: {
    display: 'flex',
    margin: '0 10px',
    justifyContent: 'space-between'
  },
  author: {
    display: 'flex'
  },
  paginationContainer: {
    display: 'flex',
    justifyContent: 'center'
  }
}))

function App() {
  const classes = useStyles()

  return (
    <div className="App">
      <AppBar className={classes.appBar} position="static">
        <Toolbar>
          <Typography variant="h6" color="primary">
            Dummy Blog
          </Typography>
        </Toolbar>
      </AppBar>
      <Box className={classes.hero}>
        <Box>React Something Something</Box>
      </Box>
      <Container maxWidth="lg" className={classes.blogsContainer}>
        <Typography variant="h4" className={classes.blogTitle}>
          Articles
        </Typography>
        <Grid container spacing={3}>
        {
          [0, 1, 2, 4, 5, 6].map(x => 
          (<Grid id={x} item xs={12} sm={6} md={4}>
            <Card className={classes.card}>
              <CardActionArea>
                <CardMedia
                  className={classes.media}
                  image='https://placekitten.com/g/200/300'
                  title='Placeholder Kitten' />
                
                <CardContent>
                  <Typography gutterBottom varian='h5' component='h2'>
                    Kitten
                  </Typography>
                  <Typography varian='body2' color='textSecondary' component='p'>
                    I do hope this sort of tutorial can help me get up to speed with rect development. I've learned a lot of theory but there's still some way to go before I'm nearly as proficient with this as I am with pure HTML/CSS/Javascript. 
                  </Typography>
                </CardContent>
              </CardActionArea>
              <CardActions className={classes.cardActions}>
                <Box className={classes.author}>
                  <Avatar src="https://thispersondoesnotexist.com/image"></Avatar>                 
                  <Box ml={2}>
                    <Typography variant='subtitle' component='p'>
                      Human Person
                    </Typography>
                    <Typography 
                      variant='subtitle2' 
                      component='p' 
                      color='textSecondary'>
                      November 7th, 2020 (Trumpfall)
                    </Typography>
                  </Box>
                  <Box>
                    <BookmarkBorderIcon />
                  </Box>
                </Box>                
              </CardActions>
            </Card>
          </Grid>))
        }
        </Grid>
        <Box my={4} className={classes.paginationContainer}>
          <Pagination count={5} />
        </Box>
      </Container>
    </div>
  );
}

export default App;
