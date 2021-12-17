/* Author: Pranav Salunke <abheyogy@gmail.com> */

const app = require('express')();
const mysql = require('mysql');
const bodyParser = require('body-parser');
const router = express.Router();

// Health Check
router.get('/health', (req, res) => {
  res.status(200).send('Ok');
});


app.use(bodyParser.json({
    limit: '8mb'
}));

const PORT = process.env.PORT || 5000;
const HOST = process.env.HOST || '0.0.0.0';

const connection = mysql.createConnection({
	host: process.env.MYSQL_HOST || '127.0.0.1',
	user: process.env.MYSQL_USER || 'demouser',
	password: process.env.MYSQL_PASSWORD || 'demopass',
	database: process.env.MYSQL_DATABASE || 'demoapp'
});

connection.connect((err) => {
	if (err) {
		console.error('error connecting mysql: ', err);
	} else {
		console.log('mysql connection successful');
		app.listen(PORT, HOST, (err) => {
			if (err) {
				console.error('Error starting  server', err);
			} else {
				console.log('server listening at port ' + PORT);
			}
		});
	}
});

// home page
app.get('/', (req, res) => {
	const query = 'SELECT * FROM musicians';
    connection.query(query, (err, results, fields) => {
    	if (err) {
    		console.error(err);
    		res.json({
    			success: false,
    			message: 'Error occured'
    		});
    	} else {
    		res.json({
    			success: true,
                message: 'List of Musicians!',
    			result: results
    		});
    	}
    });
});
