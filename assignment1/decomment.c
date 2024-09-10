#include <stdio.h>
#include <assert.h>
#include <stdlib.h>

/* This is skeleton code for reading characters from 
standard input (e.g., a file or console input) one by one until 
the end of the file (EOF) is reached. It keeps track of the current 
line number and is designed to be extended with additional 
functionality, such as processing or transforming the input data. 
In this specific task, the goal is to implement logic that removes 
C-style comments from the input. */

/* State definition
 * NORMAL: 
 * LINE_COMMENT: 
 * BLOCK_COMMENT: 
 * STRING: 
 * CHAR_LITERAL: 
 */
enum State {
	NORMAL,
	LINE_COMMENT,
	BLOCK_COMMENT,
	STRING,
	CHAR_LITERAL
};
// handle functions declaration in each state
void handle_normal(char ch, char *prev_char, enum State *state, int *line_cur, int *line_com);
void handle_block_comment(char ch, char *prev_char, enum State *state, int *line_cur);
void handle_line_comment(char ch, enum State *state, int *line_cur);
void handle_string(char ch, enum State *state);
void handle_char_literal(char ch, enum State *state);

int main(void)
{
	// ich: int type variable to store character input from getchar() (abbreviation of int character)
	int ich;
  	// line_cur & line_com: current line number and comment line number (abbreviation of current line and comment line)
  	int line_cur, line_com;
  	// ch: character that comes from casting (char) on ich (abbreviation of character)
  	char ch;
  	// prev_ch: previous character
  	char prev_char;
	// state: present state
	enum State state;

	state = NORMAL;
  	line_cur = 1;
  	line_com = -1;
  	prev_char = 0;

  	// This while loop reads all characters from standard input one by one
  	while (1) {
    		//int got_eof = 0;
		
		ich = getchar();
    		if (ich == EOF) 
      			break;
	
		ch = (char)ich;
    		// TODO: Implement the decommenting logic
		
    		switch(state){
			case NORMAL:
				handle_normal(ch, &prev_char, &state, &line_cur, &line_com);		
				break;
	
			case BLOCK_COMMENT:
				handle_block_comment(ch, &prev_char, &state, &line_cur);
				break;
	
			case LINE_COMMENT:
				handle_line_comment(ch, &state, &line_cur);
				break;
	
			case STRING:
				handle_string(ch, &state);
				break;
	
			case CHAR_LITERAL:
				handle_char_literal(ch, &state);
				break;
			default: 
				assert(0);
				break;	
    		}	
	}
	
	if (state == BLOCK_COMMENT) {
        	fprintf(stderr, "Error: line %d: unterminated comment\n", line_com);
                return(EXIT_FAILURE);
	}
	if (prev_char == '/') {
        	putchar(' ');
	}
  	return(EXIT_SUCCESS);
}
// NORMAL state handler
void handle_normal(char ch, char *prev_char, enum State *state, int *line_cur, int *line_com) {
	if (ch == '/') {
        	if (*prev_char == '/') {
            		*state = LINE_COMMENT;
            		*prev_char = 0;
        } 
		else {
            		*prev_char = ch;
        	}
 	} 
	else if (ch == '*') {
        	if (*prev_char == '/') {
            		*state = BLOCK_COMMENT;
            		*prev_char = 0;
			*line_com = *line_cur;
			putchar(' ');
        	} 
		else {
            		putchar(ch);
        	}
    	} 
	else if (ch == '"') {
        	*state = STRING;
        	putchar(ch);
    	} 
	else if (ch == '\'') {
        	*state = CHAR_LITERAL;
        	putchar(ch);
    	} 
	else {
        	if (*prev_char == '/') {
            		putchar('/');
        	}
        	putchar(ch);
		*prev_char = 0;
    	}
	
    	if (ch == '\n') {
       		(*line_cur)++;
		//putchar('\n');
    	}
	return;
}

// BLOCK_COMMENT handler
void handle_block_comment(char ch, char *prev_char, enum State *state, int *line_cur) {
	if (*prev_char == '*' && ch == '/') {
        	*state = NORMAL;
        	*prev_char = 0;
    	} 
	else if (ch == '*') {
        	*prev_char = '*';
    	} 
	else {
        	if (ch == '\n') {
            		putchar('\n');
            		(*line_cur)++;
        	}
        	*prev_char = 0;
    	}
	return;	
}

// LINE_COMMENT state handle function 
void handle_line_comment(char ch, enum State *state, int *line_cur) {
	if (ch == '\n') {
        	*state = NORMAL;
        	putchar('\n');
        	(*line_cur)++;
    	}
	return;
}

// STRING state handle function
void handle_string(char ch, enum State *state) {
    	putchar(ch);
    	if (ch == '\\') {
        	int ich = getchar();
        	if (ich != EOF) {
            		putchar((char)ich);
        	}
    	} 
	else if (ch == '"') {
        	*state = NORMAL;
    	}
	return;
}

// CHAR_LITERAL state handle function
void handle_char_literal(char ch, enum State *state) {
    	putchar(ch);
    	if (ch == '\\') {
        	int ich = getchar();
        	if (ich != EOF) {
            		putchar((char)ich);
        	}
    	}
       	else if (ch == '\'') {
        	*state = NORMAL;
    	}
	return;
}
