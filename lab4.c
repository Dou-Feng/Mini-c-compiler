int fibonacci(int n)
{
    if(n==1||n==2)
        return 1;
    else
        return fibonacci(n-1) + fibonacci(n-2);
}

int main()
{
    int i,j,k;
    i=read();
    for(j=1;j<=i;j++)
    {
        k=fibonacci(j);
        write(k);
    }
    return 0;
}

