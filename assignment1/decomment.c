#include <stdio.h>
#include <assert.h>
#include <stdlib.h>

/* 
 * Author: Jeon minseo
 * StudentID: 2019-19932
 * Assignment: assignment1
 * File: decomment.c
 * 
 * This program removes C-style comments from the input. It reads 
 * characters one by one, processes them according to the current 
 * state (NORMAL, LINE_COMMENT, BLOCK_COMMENT, STRING, CHAR_LITERAL), 
 * and outputs the result with comments removed. 
 */


enum State {
	NORMAL, // Normal text outside of comments and strings
	LINE_COMMENT, // Line comment (//)
	BLOCK_COMMENT, // Block comment (/* ... */)
	STRING,// String literal ("...")
	CHAR_LITERAL // Character literal ('...')
};
// handle functions declaration for each state
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
	// state: current state
	enum State state;

	state = NORMAL; // Initialize the state to NORMAL
  	line_cur = 1;
  	line_com = -1;
  	prev_char = 0;

  	// This while loop reads all characters from standard input one by one
  	while (1) {
		
		ich = getchar();
    		if (ich == EOF) 
      			break;
	
		ch = (char)ich;
    		// Process the character according to the current state
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
	// If a block comment is still open, report an error
	if (state == BLOCK_COMMENT) {
        	fprintf(stderr, "Error: line %d: unterminated comment\n", line_com);
                return(EXIT_FAILURE);
	}
	if (prev_char == '/') {
        	fprintf(stdout, " "); // Print a space if the last character was a '/'
	}
  	return(EXIT_SUCCESS);
}

/*
 * Handles characters in the NORMAL state. This is the default state
 * where no special comment or string parsing is occurring.
 */

void handle_normal(char ch, char *prev_char, enum State *state, int *line_cur, int *line_com) {
	if (ch == '/') {
        	if (*prev_char == '/') {
            		*state = LINE_COMMENT;
            		*prev_char = 0;
			fprintf(stdout, " "); // Replace the start of the line comment with a space
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
			fprintf(stdout, " "); // Replace the start of the line comment with a space
        	} 
		else {
            		fprintf(stdout, "%c", ch);
        	}
    	} 
	else if (ch == '"') {
        	*state = STRING;
        	fprintf(stdout, "%c", ch);
    	} 
	else if (ch == '\'') {
        	*state = CHAR_LITERAL;
        	fprintf(stdout, "%c", ch);
    	} 
	else {
        	if (*prev_char == '/') {
            		fprintf(stdout, "/");
        	}
        	fprintf(stdout, "%c", ch);
		*prev_char = 0;
    	}
	
    	if (ch == '\n') {
       		(*line_cur)++;
    	}
	return;
}

/* 
 * Handles characters in the BLOCK_COMMENT state. This state is 
 * for processing block comments that start with '/ *' and end with '* /'.
 */
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
			(*line_cur)++;
            		fprintf(stdout, "\n");
        	}
        	*prev_char = 0;
    	}
	return;	
}

/* 
 * Handles characters in the LINE_COMMENT state. This state is for 
 * processing line comments that start with '//'.
 */
void handle_line_comment(char ch, enum State *state, int *line_cur) {
	if (ch == '\t') {
		fprintf(stdout, "\t");
	}
	if (ch == '\n') {
        	*state = NORMAL;
        	(*line_cur)++;
		fprintf(stdout, "\n");
    	}

	return;
}

/* 
 * Handles characters in the STRING state. This state is for processing 
 * string literals which are enclosed in double quotes.
 */
void handle_string(char ch, enum State *state) {
    	putchar(ch);
	if (ch == '"') {
        	*state = NORMAL;
    	}
	return;
}

/* 
 * Handles characters in the CHAR_LITERAL state. This state is for processing 
 * character literals which are enclosed in single quotes.
 */
void handle_char_literal(char ch, enum State *state) {
    	putchar(ch);
       	if (ch == '\'') {
        	*state = NORMAL;
    	}
	return;
}
