def sign_up
	visit('/')
	click_link('Sign up')
	fill_in 'Email', with: 'test@example.com'
	fill_in 'Password', with: 'testtest'
	fill_in 'Password confirmation', with: 'testtest'
	click_button 'Sign up'
end

def sign_up_user_2
	visit('/')
	click_link('Sign up')
	fill_in 'Email', with: 'test2@example.com'
	fill_in 'Password', with: 'testtest'
	fill_in 'Password confirmation', with: 'testtest'
	click_button 'Sign up'
end